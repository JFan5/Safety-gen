(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v7 ?v13)
             (pred_9 ?v9 ?v12)
             (pred_6 ?v7 ?v12)
             (pred_7 ?v5 ?v7 )
	     (pred_10 ?v7)
             (pred_11 ?v2)
             (pred_4 ?v9)
             (pred_12 ?v12)
             (pred_1 ?v7)
             (pred_2 ?v9)
             (pred_3 ?v7)
             (pred_8 ))



(:action op_5
:parameters (?v8 ?v10 ?v1 ?v4)
:precondition (and (pred_11 ?v8) (pred_11 ?v10) (pred_4 ?v1) (pred_12 ?v4)
          (pred_5 ?v8 ?v10) (pred_9 ?v1 ?v4)
                   (pred_6 ?v10 ?v4) (pred_10 ?v8) 
                   (pred_1 ?v10) (pred_2 ?v1))
:effect (and  (pred_3 ?v10) (not (pred_1 ?v10))))


(:action op_2
:parameters (?v8 ?v6)
:precondition (and (pred_11 ?v8) (pred_11 ?v6)
               (pred_10 ?v8) (pred_5 ?v8 ?v6) (pred_3 ?v6))
:effect (and (pred_10 ?v6) (not (pred_10 ?v8))))

(:action op_4
:parameters (?v8 ?v1)
:precondition (and (pred_11 ?v8) (pred_4 ?v1) 
                  (pred_10 ?v8) (pred_7 ?v1 ?v8) (pred_8 ))
:effect (and (pred_2 ?v1)
   (not (pred_7 ?v1 ?v8)) (not (pred_8 ))))


(:action op_1
:parameters (?v8 ?v3 ?v11)
:precondition (and (pred_11 ?v8) (pred_4 ?v3) (pred_4 ?v11)
                  (pred_10 ?v8) (pred_2 ?v11) (pred_7 ?v3 ?v8))
:effect (and (pred_2 ?v3) (pred_7 ?v11 ?v8)
        (not (pred_2 ?v11)) (not (pred_7 ?v3 ?v8))))

(:action op_3
:parameters (?v8 ?v1)
:precondition (and (pred_11 ?v8) (pred_4 ?v1) 
                  (pred_10 ?v8) (pred_2 ?v1))
:effect (and (pred_8 ) (pred_7 ?v1 ?v8) (not (pred_2 ?v1)))))


	
