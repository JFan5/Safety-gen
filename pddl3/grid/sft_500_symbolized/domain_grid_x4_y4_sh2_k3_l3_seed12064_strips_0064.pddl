(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v6 ?v12)
             (pred_10 ?v10 ?v4)
             (pred_11 ?v6 ?v4)
             (pred_1 ?v2 ?v6 )
	     (pred_8 ?v6)
             (pred_4 ?v9)
             (pred_6 ?v10)
             (pred_5 ?v4)
             (pred_3 ?v6)
             (pred_9 ?v10)
             (pred_12 ?v6)
             (pred_2 ))



(:action op_3
:parameters (?v1 ?v7 ?v3 ?v5)
:precondition (and (pred_4 ?v1) (pred_4 ?v7) (pred_6 ?v3) (pred_5 ?v5)
          (pred_7 ?v1 ?v7) (pred_10 ?v3 ?v5)
                   (pred_11 ?v7 ?v5) (pred_8 ?v1) 
                   (pred_3 ?v7) (pred_9 ?v3))
:effect (and  (pred_12 ?v7) (not (pred_3 ?v7))))


(:action op_4
:parameters (?v1 ?v11)
:precondition (and (pred_4 ?v1) (pred_4 ?v11)
               (pred_8 ?v1) (pred_7 ?v1 ?v11) (pred_12 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v1))))

(:action op_2
:parameters (?v1 ?v3)
:precondition (and (pred_4 ?v1) (pred_6 ?v3) 
                  (pred_8 ?v1) (pred_1 ?v3 ?v1) (pred_2 ))
:effect (and (pred_9 ?v3)
   (not (pred_1 ?v3 ?v1)) (not (pred_2 ))))


(:action op_5
:parameters (?v1 ?v13 ?v8)
:precondition (and (pred_4 ?v1) (pred_6 ?v13) (pred_6 ?v8)
                  (pred_8 ?v1) (pred_9 ?v8) (pred_1 ?v13 ?v1))
:effect (and (pred_9 ?v13) (pred_1 ?v8 ?v1)
        (not (pred_9 ?v8)) (not (pred_1 ?v13 ?v1))))

(:action op_1
:parameters (?v1 ?v3)
:precondition (and (pred_4 ?v1) (pred_6 ?v3) 
                  (pred_8 ?v1) (pred_9 ?v3))
:effect (and (pred_2 ) (pred_1 ?v3 ?v1) (not (pred_9 ?v3)))))


	
