(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v7 ?v4)
             (pred_7 ?v10 ?v8)
             (pred_6 ?v7 ?v8)
             (pred_9 ?v9 ?v7 )
	     (pred_11 ?v7)
             (pred_3 ?v6)
             (pred_5 ?v10)
             (pred_2 ?v8)
             (pred_12 ?v7)
             (pred_4 ?v10)
             (pred_1 ?v7)
             (pred_10 ))



(:action op_1
:parameters (?v13 ?v5 ?v12 ?v2)
:precondition (and (pred_3 ?v13) (pred_3 ?v5) (pred_5 ?v12) (pred_2 ?v2)
          (pred_8 ?v13 ?v5) (pred_7 ?v12 ?v2)
                   (pred_6 ?v5 ?v2) (pred_11 ?v13) 
                   (pred_12 ?v5) (pred_4 ?v12))
:effect (and  (pred_1 ?v5) (not (pred_12 ?v5))))


(:action op_3
:parameters (?v13 ?v3)
:precondition (and (pred_3 ?v13) (pred_3 ?v3)
               (pred_11 ?v13) (pred_8 ?v13 ?v3) (pred_1 ?v3))
:effect (and (pred_11 ?v3) (not (pred_11 ?v13))))

(:action op_5
:parameters (?v13 ?v12)
:precondition (and (pred_3 ?v13) (pred_5 ?v12) 
                  (pred_11 ?v13) (pred_9 ?v12 ?v13) (pred_10 ))
:effect (and (pred_4 ?v12)
   (not (pred_9 ?v12 ?v13)) (not (pred_10 ))))


(:action op_2
:parameters (?v13 ?v11 ?v1)
:precondition (and (pred_3 ?v13) (pred_5 ?v11) (pred_5 ?v1)
                  (pred_11 ?v13) (pred_4 ?v1) (pred_9 ?v11 ?v13))
:effect (and (pred_4 ?v11) (pred_9 ?v1 ?v13)
        (not (pred_4 ?v1)) (not (pred_9 ?v11 ?v13))))

(:action op_4
:parameters (?v13 ?v12)
:precondition (and (pred_3 ?v13) (pred_5 ?v12) 
                  (pred_11 ?v13) (pred_4 ?v12))
:effect (and (pred_10 ) (pred_9 ?v12 ?v13) (not (pred_4 ?v12)))))


	
