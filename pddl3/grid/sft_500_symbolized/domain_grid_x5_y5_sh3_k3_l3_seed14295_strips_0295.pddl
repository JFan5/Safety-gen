(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v8 ?v7)
             (pred_10 ?v2 ?v3)
             (pred_11 ?v8 ?v3)
             (pred_2 ?v4 ?v8 )
	     (pred_12 ?v8)
             (pred_9 ?v6)
             (pred_4 ?v2)
             (pred_7 ?v3)
             (pred_5 ?v8)
             (pred_3 ?v2)
             (pred_1 ?v8)
             (pred_6 ))



(:action op_4
:parameters (?v13 ?v12 ?v1 ?v9)
:precondition (and (pred_9 ?v13) (pred_9 ?v12) (pred_4 ?v1) (pred_7 ?v9)
          (pred_8 ?v13 ?v12) (pred_10 ?v1 ?v9)
                   (pred_11 ?v12 ?v9) (pred_12 ?v13) 
                   (pred_5 ?v12) (pred_3 ?v1))
:effect (and  (pred_1 ?v12) (not (pred_5 ?v12))))


(:action op_3
:parameters (?v13 ?v10)
:precondition (and (pred_9 ?v13) (pred_9 ?v10)
               (pred_12 ?v13) (pred_8 ?v13 ?v10) (pred_1 ?v10))
:effect (and (pred_12 ?v10) (not (pred_12 ?v13))))

(:action op_2
:parameters (?v13 ?v1)
:precondition (and (pred_9 ?v13) (pred_4 ?v1) 
                  (pred_12 ?v13) (pred_2 ?v1 ?v13) (pred_6 ))
:effect (and (pred_3 ?v1)
   (not (pred_2 ?v1 ?v13)) (not (pred_6 ))))


(:action op_5
:parameters (?v13 ?v5 ?v11)
:precondition (and (pred_9 ?v13) (pred_4 ?v5) (pred_4 ?v11)
                  (pred_12 ?v13) (pred_3 ?v11) (pred_2 ?v5 ?v13))
:effect (and (pred_3 ?v5) (pred_2 ?v11 ?v13)
        (not (pred_3 ?v11)) (not (pred_2 ?v5 ?v13))))

(:action op_1
:parameters (?v13 ?v1)
:precondition (and (pred_9 ?v13) (pred_4 ?v1) 
                  (pred_12 ?v13) (pred_3 ?v1))
:effect (and (pred_6 ) (pred_2 ?v1 ?v13) (not (pred_3 ?v1)))))


	
