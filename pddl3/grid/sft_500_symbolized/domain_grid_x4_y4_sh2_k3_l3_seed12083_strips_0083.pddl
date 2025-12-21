(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v2 ?v5)
             (pred_12 ?v10 ?v7)
             (pred_5 ?v2 ?v7)
             (pred_11 ?v9 ?v2 )
	     (pred_1 ?v2)
             (pred_8 ?v4)
             (pred_10 ?v10)
             (pred_6 ?v7)
             (pred_4 ?v2)
             (pred_2 ?v10)
             (pred_9 ?v2)
             (pred_7 ))



(:action op_3
:parameters (?v12 ?v8 ?v6 ?v13)
:precondition (and (pred_8 ?v12) (pred_8 ?v8) (pred_10 ?v6) (pred_6 ?v13)
          (pred_3 ?v12 ?v8) (pred_12 ?v6 ?v13)
                   (pred_5 ?v8 ?v13) (pred_1 ?v12) 
                   (pred_4 ?v8) (pred_2 ?v6))
:effect (and  (pred_9 ?v8) (not (pred_4 ?v8))))


(:action op_5
:parameters (?v12 ?v3)
:precondition (and (pred_8 ?v12) (pred_8 ?v3)
               (pred_1 ?v12) (pred_3 ?v12 ?v3) (pred_9 ?v3))
:effect (and (pred_1 ?v3) (not (pred_1 ?v12))))

(:action op_4
:parameters (?v12 ?v6)
:precondition (and (pred_8 ?v12) (pred_10 ?v6) 
                  (pred_1 ?v12) (pred_11 ?v6 ?v12) (pred_7 ))
:effect (and (pred_2 ?v6)
   (not (pred_11 ?v6 ?v12)) (not (pred_7 ))))


(:action op_1
:parameters (?v12 ?v1 ?v11)
:precondition (and (pred_8 ?v12) (pred_10 ?v1) (pred_10 ?v11)
                  (pred_1 ?v12) (pred_2 ?v11) (pred_11 ?v1 ?v12))
:effect (and (pred_2 ?v1) (pred_11 ?v11 ?v12)
        (not (pred_2 ?v11)) (not (pred_11 ?v1 ?v12))))

(:action op_2
:parameters (?v12 ?v6)
:precondition (and (pred_8 ?v12) (pred_10 ?v6) 
                  (pred_1 ?v12) (pred_2 ?v6))
:effect (and (pred_7 ) (pred_11 ?v6 ?v12) (not (pred_2 ?v6)))))


	
