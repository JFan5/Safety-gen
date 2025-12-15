(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v10 ?v4)
             (pred_7 ?v12 ?v2)
             (pred_2 ?v10 ?v2)
             (pred_9 ?v5 ?v10 )
	     (pred_3 ?v10)
             (pred_8 ?v7)
             (pred_10 ?v12)
             (pred_5 ?v2)
             (pred_4 ?v10)
             (pred_1 ?v12)
             (pred_11 ?v10)
             (pred_12 ))



(:action op_2
:parameters (?v1 ?v3 ?v9 ?v6)
:precondition (and (pred_8 ?v1) (pred_8 ?v3) (pred_10 ?v9) (pred_5 ?v6)
          (pred_6 ?v1 ?v3) (pred_7 ?v9 ?v6)
                   (pred_2 ?v3 ?v6) (pred_3 ?v1) 
                   (pred_4 ?v3) (pred_1 ?v9))
:effect (and  (pred_11 ?v3) (not (pred_4 ?v3))))


(:action op_3
:parameters (?v1 ?v8)
:precondition (and (pred_8 ?v1) (pred_8 ?v8)
               (pred_3 ?v1) (pred_6 ?v1 ?v8) (pred_11 ?v8))
:effect (and (pred_3 ?v8) (not (pred_3 ?v1))))

(:action op_4
:parameters (?v1 ?v9)
:precondition (and (pred_8 ?v1) (pred_10 ?v9) 
                  (pred_3 ?v1) (pred_9 ?v9 ?v1) (pred_12 ))
:effect (and (pred_1 ?v9)
   (not (pred_9 ?v9 ?v1)) (not (pred_12 ))))


(:action op_1
:parameters (?v1 ?v13 ?v11)
:precondition (and (pred_8 ?v1) (pred_10 ?v13) (pred_10 ?v11)
                  (pred_3 ?v1) (pred_1 ?v11) (pred_9 ?v13 ?v1))
:effect (and (pred_1 ?v13) (pred_9 ?v11 ?v1)
        (not (pred_1 ?v11)) (not (pred_9 ?v13 ?v1))))

(:action op_5
:parameters (?v1 ?v9)
:precondition (and (pred_8 ?v1) (pred_10 ?v9) 
                  (pred_3 ?v1) (pred_1 ?v9))
:effect (and (pred_12 ) (pred_9 ?v9 ?v1) (not (pred_1 ?v9)))))


	
