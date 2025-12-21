(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v2 ?v13)
             (pred_5 ?v3 ?v7)
             (pred_2 ?v2 ?v7)
             (pred_4 ?v11 ?v2 )
	     (pred_7 ?v2)
             (pred_8 ?v10)
             (pred_6 ?v3)
             (pred_12 ?v7)
             (pred_9 ?v2)
             (pred_3 ?v3)
             (pred_10 ?v2)
             (pred_1 ))



(:action op_5
:parameters (?v12 ?v4 ?v6 ?v8)
:precondition (and (pred_8 ?v12) (pred_8 ?v4) (pred_6 ?v6) (pred_12 ?v8)
          (pred_11 ?v12 ?v4) (pred_5 ?v6 ?v8)
                   (pred_2 ?v4 ?v8) (pred_7 ?v12) 
                   (pred_9 ?v4) (pred_3 ?v6))
:effect (and  (pred_10 ?v4) (not (pred_9 ?v4))))


(:action op_1
:parameters (?v12 ?v9)
:precondition (and (pred_8 ?v12) (pred_8 ?v9)
               (pred_7 ?v12) (pred_11 ?v12 ?v9) (pred_10 ?v9))
:effect (and (pred_7 ?v9) (not (pred_7 ?v12))))

(:action op_4
:parameters (?v12 ?v6)
:precondition (and (pred_8 ?v12) (pred_6 ?v6) 
                  (pred_7 ?v12) (pred_4 ?v6 ?v12) (pred_1 ))
:effect (and (pred_3 ?v6)
   (not (pred_4 ?v6 ?v12)) (not (pred_1 ))))


(:action op_3
:parameters (?v12 ?v1 ?v5)
:precondition (and (pred_8 ?v12) (pred_6 ?v1) (pred_6 ?v5)
                  (pred_7 ?v12) (pred_3 ?v5) (pred_4 ?v1 ?v12))
:effect (and (pred_3 ?v1) (pred_4 ?v5 ?v12)
        (not (pred_3 ?v5)) (not (pred_4 ?v1 ?v12))))

(:action op_2
:parameters (?v12 ?v6)
:precondition (and (pred_8 ?v12) (pred_6 ?v6) 
                  (pred_7 ?v12) (pred_3 ?v6))
:effect (and (pred_1 ) (pred_4 ?v6 ?v12) (not (pred_3 ?v6)))))


	
