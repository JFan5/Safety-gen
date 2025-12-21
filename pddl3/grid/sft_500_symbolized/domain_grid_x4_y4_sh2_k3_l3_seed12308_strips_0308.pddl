(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v3 ?v9)
             (pred_11 ?v8 ?v6)
             (pred_3 ?v3 ?v6)
             (pred_2 ?v10 ?v3 )
	     (pred_4 ?v3)
             (pred_12 ?v2)
             (pred_6 ?v8)
             (pred_8 ?v6)
             (pred_9 ?v3)
             (pred_10 ?v8)
             (pred_5 ?v3)
             (pred_1 ))



(:action op_2
:parameters (?v13 ?v5 ?v12 ?v1)
:precondition (and (pred_12 ?v13) (pred_12 ?v5) (pred_6 ?v12) (pred_8 ?v1)
          (pred_7 ?v13 ?v5) (pred_11 ?v12 ?v1)
                   (pred_3 ?v5 ?v1) (pred_4 ?v13) 
                   (pred_9 ?v5) (pred_10 ?v12))
:effect (and  (pred_5 ?v5) (not (pred_9 ?v5))))


(:action op_4
:parameters (?v13 ?v7)
:precondition (and (pred_12 ?v13) (pred_12 ?v7)
               (pred_4 ?v13) (pred_7 ?v13 ?v7) (pred_5 ?v7))
:effect (and (pred_4 ?v7) (not (pred_4 ?v13))))

(:action op_5
:parameters (?v13 ?v12)
:precondition (and (pred_12 ?v13) (pred_6 ?v12) 
                  (pred_4 ?v13) (pred_2 ?v12 ?v13) (pred_1 ))
:effect (and (pred_10 ?v12)
   (not (pred_2 ?v12 ?v13)) (not (pred_1 ))))


(:action op_1
:parameters (?v13 ?v4 ?v11)
:precondition (and (pred_12 ?v13) (pred_6 ?v4) (pred_6 ?v11)
                  (pred_4 ?v13) (pred_10 ?v11) (pred_2 ?v4 ?v13))
:effect (and (pred_10 ?v4) (pred_2 ?v11 ?v13)
        (not (pred_10 ?v11)) (not (pred_2 ?v4 ?v13))))

(:action op_3
:parameters (?v13 ?v12)
:precondition (and (pred_12 ?v13) (pred_6 ?v12) 
                  (pred_4 ?v13) (pred_10 ?v12))
:effect (and (pred_1 ) (pred_2 ?v12 ?v13) (not (pred_10 ?v12)))))


	
