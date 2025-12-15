(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v6 ?v4)
             (pred_1 ?v12 ?v13)
             (pred_12 ?v6 ?v13)
             (pred_10 ?v2 ?v6 )
	     (pred_3 ?v6)
             (pred_4 ?v3)
             (pred_7 ?v12)
             (pred_6 ?v13)
             (pred_5 ?v6)
             (pred_9 ?v12)
             (pred_8 ?v6)
             (pred_2 ))



(:action op_1
:parameters (?v10 ?v8 ?v1 ?v9)
:precondition (and (pred_4 ?v10) (pred_4 ?v8) (pred_7 ?v1) (pred_6 ?v9)
          (pred_11 ?v10 ?v8) (pred_1 ?v1 ?v9)
                   (pred_12 ?v8 ?v9) (pred_3 ?v10) 
                   (pred_5 ?v8) (pred_9 ?v1))
:effect (and  (pred_8 ?v8) (not (pred_5 ?v8))))


(:action op_4
:parameters (?v10 ?v7)
:precondition (and (pred_4 ?v10) (pred_4 ?v7)
               (pred_3 ?v10) (pred_11 ?v10 ?v7) (pred_8 ?v7))
:effect (and (pred_3 ?v7) (not (pred_3 ?v10))))

(:action op_3
:parameters (?v10 ?v1)
:precondition (and (pred_4 ?v10) (pred_7 ?v1) 
                  (pred_3 ?v10) (pred_10 ?v1 ?v10) (pred_2 ))
:effect (and (pred_9 ?v1)
   (not (pred_10 ?v1 ?v10)) (not (pred_2 ))))


(:action op_2
:parameters (?v10 ?v5 ?v11)
:precondition (and (pred_4 ?v10) (pred_7 ?v5) (pred_7 ?v11)
                  (pred_3 ?v10) (pred_9 ?v11) (pred_10 ?v5 ?v10))
:effect (and (pred_9 ?v5) (pred_10 ?v11 ?v10)
        (not (pred_9 ?v11)) (not (pred_10 ?v5 ?v10))))

(:action op_5
:parameters (?v10 ?v1)
:precondition (and (pred_4 ?v10) (pred_7 ?v1) 
                  (pred_3 ?v10) (pred_9 ?v1))
:effect (and (pred_2 ) (pred_10 ?v1 ?v10) (not (pred_9 ?v1)))))


	
