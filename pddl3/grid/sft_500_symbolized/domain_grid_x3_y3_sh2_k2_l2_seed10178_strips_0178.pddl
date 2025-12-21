(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v10 ?v9)
             (pred_9 ?v11 ?v6)
             (pred_10 ?v10 ?v6)
             (pred_6 ?v2 ?v10 )
	     (pred_4 ?v10)
             (pred_12 ?v3)
             (pred_2 ?v11)
             (pred_11 ?v6)
             (pred_5 ?v10)
             (pred_8 ?v11)
             (pred_7 ?v10)
             (pred_1 ))



(:action op_5
:parameters (?v13 ?v5 ?v12 ?v7)
:precondition (and (pred_12 ?v13) (pred_12 ?v5) (pred_2 ?v12) (pred_11 ?v7)
          (pred_3 ?v13 ?v5) (pred_9 ?v12 ?v7)
                   (pred_10 ?v5 ?v7) (pred_4 ?v13) 
                   (pred_5 ?v5) (pred_8 ?v12))
:effect (and  (pred_7 ?v5) (not (pred_5 ?v5))))


(:action op_3
:parameters (?v13 ?v4)
:precondition (and (pred_12 ?v13) (pred_12 ?v4)
               (pred_4 ?v13) (pred_3 ?v13 ?v4) (pred_7 ?v4))
:effect (and (pred_4 ?v4) (not (pred_4 ?v13))))

(:action op_1
:parameters (?v13 ?v12)
:precondition (and (pred_12 ?v13) (pred_2 ?v12) 
                  (pred_4 ?v13) (pred_6 ?v12 ?v13) (pred_1 ))
:effect (and (pred_8 ?v12)
   (not (pred_6 ?v12 ?v13)) (not (pred_1 ))))


(:action op_2
:parameters (?v13 ?v8 ?v1)
:precondition (and (pred_12 ?v13) (pred_2 ?v8) (pred_2 ?v1)
                  (pred_4 ?v13) (pred_8 ?v1) (pred_6 ?v8 ?v13))
:effect (and (pred_8 ?v8) (pred_6 ?v1 ?v13)
        (not (pred_8 ?v1)) (not (pred_6 ?v8 ?v13))))

(:action op_4
:parameters (?v13 ?v12)
:precondition (and (pred_12 ?v13) (pred_2 ?v12) 
                  (pred_4 ?v13) (pred_8 ?v12))
:effect (and (pred_1 ) (pred_6 ?v12 ?v13) (not (pred_8 ?v12)))))


	
