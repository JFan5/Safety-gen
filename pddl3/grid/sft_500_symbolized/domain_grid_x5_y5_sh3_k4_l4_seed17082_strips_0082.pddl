(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v11 ?v9)
             (pred_12 ?v2 ?v7)
             (pred_3 ?v11 ?v7)
             (pred_2 ?v4 ?v11 )
	     (pred_4 ?v11)
             (pred_1 ?v13)
             (pred_6 ?v2)
             (pred_7 ?v7)
             (pred_10 ?v11)
             (pred_11 ?v2)
             (pred_8 ?v11)
             (pred_5 ))



(:action op_2
:parameters (?v12 ?v8 ?v6 ?v1)
:precondition (and (pred_1 ?v12) (pred_1 ?v8) (pred_6 ?v6) (pred_7 ?v1)
          (pred_9 ?v12 ?v8) (pred_12 ?v6 ?v1)
                   (pred_3 ?v8 ?v1) (pred_4 ?v12) 
                   (pred_10 ?v8) (pred_11 ?v6))
:effect (and  (pred_8 ?v8) (not (pred_10 ?v8))))


(:action op_1
:parameters (?v12 ?v3)
:precondition (and (pred_1 ?v12) (pred_1 ?v3)
               (pred_4 ?v12) (pred_9 ?v12 ?v3) (pred_8 ?v3))
:effect (and (pred_4 ?v3) (not (pred_4 ?v12))))

(:action op_4
:parameters (?v12 ?v6)
:precondition (and (pred_1 ?v12) (pred_6 ?v6) 
                  (pred_4 ?v12) (pred_2 ?v6 ?v12) (pred_5 ))
:effect (and (pred_11 ?v6)
   (not (pred_2 ?v6 ?v12)) (not (pred_5 ))))


(:action op_3
:parameters (?v12 ?v5 ?v10)
:precondition (and (pred_1 ?v12) (pred_6 ?v5) (pred_6 ?v10)
                  (pred_4 ?v12) (pred_11 ?v10) (pred_2 ?v5 ?v12))
:effect (and (pred_11 ?v5) (pred_2 ?v10 ?v12)
        (not (pred_11 ?v10)) (not (pred_2 ?v5 ?v12))))

(:action op_5
:parameters (?v12 ?v6)
:precondition (and (pred_1 ?v12) (pred_6 ?v6) 
                  (pred_4 ?v12) (pred_11 ?v6))
:effect (and (pred_5 ) (pred_2 ?v6 ?v12) (not (pred_11 ?v6)))))


	
