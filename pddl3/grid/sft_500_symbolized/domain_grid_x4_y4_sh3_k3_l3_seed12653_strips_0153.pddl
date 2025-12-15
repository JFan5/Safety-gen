(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v8 ?v9)
             (pred_10 ?v4 ?v10)
             (pred_9 ?v8 ?v10)
             (pred_7 ?v7 ?v8 )
	     (pred_11 ?v8)
             (pred_8 ?v13)
             (pred_4 ?v4)
             (pred_2 ?v10)
             (pred_5 ?v8)
             (pred_1 ?v4)
             (pred_12 ?v8)
             (pred_6 ))



(:action op_4
:parameters (?v3 ?v12 ?v5 ?v2)
:precondition (and (pred_8 ?v3) (pred_8 ?v12) (pred_4 ?v5) (pred_2 ?v2)
          (pred_3 ?v3 ?v12) (pred_10 ?v5 ?v2)
                   (pred_9 ?v12 ?v2) (pred_11 ?v3) 
                   (pred_5 ?v12) (pred_1 ?v5))
:effect (and  (pred_12 ?v12) (not (pred_5 ?v12))))


(:action op_5
:parameters (?v3 ?v11)
:precondition (and (pred_8 ?v3) (pred_8 ?v11)
               (pred_11 ?v3) (pred_3 ?v3 ?v11) (pred_12 ?v11))
:effect (and (pred_11 ?v11) (not (pred_11 ?v3))))

(:action op_1
:parameters (?v3 ?v5)
:precondition (and (pred_8 ?v3) (pred_4 ?v5) 
                  (pred_11 ?v3) (pred_7 ?v5 ?v3) (pred_6 ))
:effect (and (pred_1 ?v5)
   (not (pred_7 ?v5 ?v3)) (not (pred_6 ))))


(:action op_2
:parameters (?v3 ?v1 ?v6)
:precondition (and (pred_8 ?v3) (pred_4 ?v1) (pred_4 ?v6)
                  (pred_11 ?v3) (pred_1 ?v6) (pred_7 ?v1 ?v3))
:effect (and (pred_1 ?v1) (pred_7 ?v6 ?v3)
        (not (pred_1 ?v6)) (not (pred_7 ?v1 ?v3))))

(:action op_3
:parameters (?v3 ?v5)
:precondition (and (pred_8 ?v3) (pred_4 ?v5) 
                  (pred_11 ?v3) (pred_1 ?v5))
:effect (and (pred_6 ) (pred_7 ?v5 ?v3) (not (pred_1 ?v5)))))


	
