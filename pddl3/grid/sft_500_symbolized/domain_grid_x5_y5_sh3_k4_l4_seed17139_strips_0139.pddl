(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v13)
             (pred_2 ?v2 ?v11)
             (pred_11 ?v9 ?v11)
             (pred_7 ?v7 ?v9 )
	     (pred_1 ?v9)
             (pred_5 ?v10)
             (pred_3 ?v2)
             (pred_6 ?v11)
             (pred_12 ?v9)
             (pred_8 ?v2)
             (pred_9 ?v9)
             (pred_4 ))



(:action op_1
:parameters (?v4 ?v3 ?v6 ?v1)
:precondition (and (pred_5 ?v4) (pred_5 ?v3) (pred_3 ?v6) (pred_6 ?v1)
          (pred_10 ?v4 ?v3) (pred_2 ?v6 ?v1)
                   (pred_11 ?v3 ?v1) (pred_1 ?v4) 
                   (pred_12 ?v3) (pred_8 ?v6))
:effect (and  (pred_9 ?v3) (not (pred_12 ?v3))))


(:action op_4
:parameters (?v4 ?v5)
:precondition (and (pred_5 ?v4) (pred_5 ?v5)
               (pred_1 ?v4) (pred_10 ?v4 ?v5) (pred_9 ?v5))
:effect (and (pred_1 ?v5) (not (pred_1 ?v4))))

(:action op_5
:parameters (?v4 ?v6)
:precondition (and (pred_5 ?v4) (pred_3 ?v6) 
                  (pred_1 ?v4) (pred_7 ?v6 ?v4) (pred_4 ))
:effect (and (pred_8 ?v6)
   (not (pred_7 ?v6 ?v4)) (not (pred_4 ))))


(:action op_2
:parameters (?v4 ?v12 ?v8)
:precondition (and (pred_5 ?v4) (pred_3 ?v12) (pred_3 ?v8)
                  (pred_1 ?v4) (pred_8 ?v8) (pred_7 ?v12 ?v4))
:effect (and (pred_8 ?v12) (pred_7 ?v8 ?v4)
        (not (pred_8 ?v8)) (not (pred_7 ?v12 ?v4))))

(:action op_3
:parameters (?v4 ?v6)
:precondition (and (pred_5 ?v4) (pred_3 ?v6) 
                  (pred_1 ?v4) (pred_8 ?v6))
:effect (and (pred_4 ) (pred_7 ?v6 ?v4) (not (pred_8 ?v6)))))


	
