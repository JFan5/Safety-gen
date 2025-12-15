(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v5 ?v8)
             (pred_9 ?v11 ?v9)
             (pred_2 ?v5 ?v9)
             (pred_6 ?v13 ?v5 )
	     (pred_3 ?v5)
             (pred_11 ?v1)
             (pred_10 ?v11)
             (pred_1 ?v9)
             (pred_4 ?v5)
             (pred_7 ?v11)
             (pred_12 ?v5)
             (pred_5 ))



(:action op_5
:parameters (?v12 ?v6 ?v7 ?v3)
:precondition (and (pred_11 ?v12) (pred_11 ?v6) (pred_10 ?v7) (pred_1 ?v3)
          (pred_8 ?v12 ?v6) (pred_9 ?v7 ?v3)
                   (pred_2 ?v6 ?v3) (pred_3 ?v12) 
                   (pred_4 ?v6) (pred_7 ?v7))
:effect (and  (pred_12 ?v6) (not (pred_4 ?v6))))


(:action op_4
:parameters (?v12 ?v10)
:precondition (and (pred_11 ?v12) (pred_11 ?v10)
               (pred_3 ?v12) (pred_8 ?v12 ?v10) (pred_12 ?v10))
:effect (and (pred_3 ?v10) (not (pred_3 ?v12))))

(:action op_1
:parameters (?v12 ?v7)
:precondition (and (pred_11 ?v12) (pred_10 ?v7) 
                  (pred_3 ?v12) (pred_6 ?v7 ?v12) (pred_5 ))
:effect (and (pred_7 ?v7)
   (not (pred_6 ?v7 ?v12)) (not (pred_5 ))))


(:action op_3
:parameters (?v12 ?v2 ?v4)
:precondition (and (pred_11 ?v12) (pred_10 ?v2) (pred_10 ?v4)
                  (pred_3 ?v12) (pred_7 ?v4) (pred_6 ?v2 ?v12))
:effect (and (pred_7 ?v2) (pred_6 ?v4 ?v12)
        (not (pred_7 ?v4)) (not (pred_6 ?v2 ?v12))))

(:action op_2
:parameters (?v12 ?v7)
:precondition (and (pred_11 ?v12) (pred_10 ?v7) 
                  (pred_3 ?v12) (pred_7 ?v7))
:effect (and (pred_5 ) (pred_6 ?v7 ?v12) (not (pred_7 ?v7)))))


	
