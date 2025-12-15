(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v1 ?v13)
             (pred_7 ?v3 ?v12)
             (pred_10 ?v1 ?v12)
             (pred_4 ?v7 ?v1 )
	     (pred_1 ?v1)
             (pred_12 ?v11)
             (pred_3 ?v3)
             (pred_5 ?v12)
             (pred_11 ?v1)
             (pred_9 ?v3)
             (pred_8 ?v1)
             (pred_6 ))



(:action op_3
:parameters (?v10 ?v6 ?v8 ?v5)
:precondition (and (pred_12 ?v10) (pred_12 ?v6) (pred_3 ?v8) (pred_5 ?v5)
          (pred_2 ?v10 ?v6) (pred_7 ?v8 ?v5)
                   (pred_10 ?v6 ?v5) (pred_1 ?v10) 
                   (pred_11 ?v6) (pred_9 ?v8))
:effect (and  (pred_8 ?v6) (not (pred_11 ?v6))))


(:action op_5
:parameters (?v10 ?v4)
:precondition (and (pred_12 ?v10) (pred_12 ?v4)
               (pred_1 ?v10) (pred_2 ?v10 ?v4) (pred_8 ?v4))
:effect (and (pred_1 ?v4) (not (pred_1 ?v10))))

(:action op_2
:parameters (?v10 ?v8)
:precondition (and (pred_12 ?v10) (pred_3 ?v8) 
                  (pred_1 ?v10) (pred_4 ?v8 ?v10) (pred_6 ))
:effect (and (pred_9 ?v8)
   (not (pred_4 ?v8 ?v10)) (not (pred_6 ))))


(:action op_1
:parameters (?v10 ?v9 ?v2)
:precondition (and (pred_12 ?v10) (pred_3 ?v9) (pred_3 ?v2)
                  (pred_1 ?v10) (pred_9 ?v2) (pred_4 ?v9 ?v10))
:effect (and (pred_9 ?v9) (pred_4 ?v2 ?v10)
        (not (pred_9 ?v2)) (not (pred_4 ?v9 ?v10))))

(:action op_4
:parameters (?v10 ?v8)
:precondition (and (pred_12 ?v10) (pred_3 ?v8) 
                  (pred_1 ?v10) (pred_9 ?v8))
:effect (and (pred_6 ) (pred_4 ?v8 ?v10) (not (pred_9 ?v8)))))


	
