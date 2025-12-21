(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v6 ?v10)
             (pred_8 ?v2 ?v3)
             (pred_3 ?v6 ?v3)
             (pred_7 ?v11 ?v6 )
	     (pred_5 ?v6)
             (pred_10 ?v1)
             (pred_1 ?v2)
             (pred_6 ?v3)
             (pred_11 ?v6)
             (pred_2 ?v2)
             (pred_12 ?v6)
             (pred_9 ))



(:action op_1
:parameters (?v4 ?v12 ?v7 ?v8)
:precondition (and (pred_10 ?v4) (pred_10 ?v12) (pred_1 ?v7) (pred_6 ?v8)
          (pred_4 ?v4 ?v12) (pred_8 ?v7 ?v8)
                   (pred_3 ?v12 ?v8) (pred_5 ?v4) 
                   (pred_11 ?v12) (pred_2 ?v7))
:effect (and  (pred_12 ?v12) (not (pred_11 ?v12))))


(:action op_2
:parameters (?v4 ?v13)
:precondition (and (pred_10 ?v4) (pred_10 ?v13)
               (pred_5 ?v4) (pred_4 ?v4 ?v13) (pred_12 ?v13))
:effect (and (pred_5 ?v13) (not (pred_5 ?v4))))

(:action op_5
:parameters (?v4 ?v7)
:precondition (and (pred_10 ?v4) (pred_1 ?v7) 
                  (pred_5 ?v4) (pred_7 ?v7 ?v4) (pred_9 ))
:effect (and (pred_2 ?v7)
   (not (pred_7 ?v7 ?v4)) (not (pred_9 ))))


(:action op_3
:parameters (?v4 ?v5 ?v9)
:precondition (and (pred_10 ?v4) (pred_1 ?v5) (pred_1 ?v9)
                  (pred_5 ?v4) (pred_2 ?v9) (pred_7 ?v5 ?v4))
:effect (and (pred_2 ?v5) (pred_7 ?v9 ?v4)
        (not (pred_2 ?v9)) (not (pred_7 ?v5 ?v4))))

(:action op_4
:parameters (?v4 ?v7)
:precondition (and (pred_10 ?v4) (pred_1 ?v7) 
                  (pred_5 ?v4) (pred_2 ?v7))
:effect (and (pred_9 ) (pred_7 ?v7 ?v4) (not (pred_2 ?v7)))))


	
