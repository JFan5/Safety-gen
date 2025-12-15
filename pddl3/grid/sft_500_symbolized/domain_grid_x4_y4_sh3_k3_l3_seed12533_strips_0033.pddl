(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v12 ?v6)
             (pred_5 ?v5 ?v13)
             (pred_7 ?v12 ?v13)
             (pred_1 ?v11 ?v12 )
	     (pred_9 ?v12)
             (pred_3 ?v4)
             (pred_12 ?v5)
             (pred_11 ?v13)
             (pred_4 ?v12)
             (pred_10 ?v5)
             (pred_2 ?v12)
             (pred_6 ))



(:action op_5
:parameters (?v10 ?v7 ?v9 ?v1)
:precondition (and (pred_3 ?v10) (pred_3 ?v7) (pred_12 ?v9) (pred_11 ?v1)
          (pred_8 ?v10 ?v7) (pred_5 ?v9 ?v1)
                   (pred_7 ?v7 ?v1) (pred_9 ?v10) 
                   (pred_4 ?v7) (pred_10 ?v9))
:effect (and  (pred_2 ?v7) (not (pred_4 ?v7))))


(:action op_2
:parameters (?v10 ?v3)
:precondition (and (pred_3 ?v10) (pred_3 ?v3)
               (pred_9 ?v10) (pred_8 ?v10 ?v3) (pred_2 ?v3))
:effect (and (pred_9 ?v3) (not (pred_9 ?v10))))

(:action op_3
:parameters (?v10 ?v9)
:precondition (and (pred_3 ?v10) (pred_12 ?v9) 
                  (pred_9 ?v10) (pred_1 ?v9 ?v10) (pred_6 ))
:effect (and (pred_10 ?v9)
   (not (pred_1 ?v9 ?v10)) (not (pred_6 ))))


(:action op_4
:parameters (?v10 ?v2 ?v8)
:precondition (and (pred_3 ?v10) (pred_12 ?v2) (pred_12 ?v8)
                  (pred_9 ?v10) (pred_10 ?v8) (pred_1 ?v2 ?v10))
:effect (and (pred_10 ?v2) (pred_1 ?v8 ?v10)
        (not (pred_10 ?v8)) (not (pred_1 ?v2 ?v10))))

(:action op_1
:parameters (?v10 ?v9)
:precondition (and (pred_3 ?v10) (pred_12 ?v9) 
                  (pred_9 ?v10) (pred_10 ?v9))
:effect (and (pred_6 ) (pred_1 ?v9 ?v10) (not (pred_10 ?v9)))))


	
