(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v1 ?v6)
             (pred_11 ?v9 ?v11)
             (pred_8 ?v1 ?v11)
             (pred_2 ?v13 ?v1 )
	     (pred_5 ?v1)
             (pred_10 ?v8)
             (pred_4 ?v9)
             (pred_12 ?v11)
             (pred_9 ?v1)
             (pred_6 ?v9)
             (pred_7 ?v1)
             (pred_3 ))



(:action op_2
:parameters (?v4 ?v12 ?v3 ?v5)
:precondition (and (pred_10 ?v4) (pred_10 ?v12) (pred_4 ?v3) (pred_12 ?v5)
          (pred_1 ?v4 ?v12) (pred_11 ?v3 ?v5)
                   (pred_8 ?v12 ?v5) (pred_5 ?v4) 
                   (pred_9 ?v12) (pred_6 ?v3))
:effect (and  (pred_7 ?v12) (not (pred_9 ?v12))))


(:action op_1
:parameters (?v4 ?v7)
:precondition (and (pred_10 ?v4) (pred_10 ?v7)
               (pred_5 ?v4) (pred_1 ?v4 ?v7) (pred_7 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v4))))

(:action op_5
:parameters (?v4 ?v3)
:precondition (and (pred_10 ?v4) (pred_4 ?v3) 
                  (pred_5 ?v4) (pred_2 ?v3 ?v4) (pred_3 ))
:effect (and (pred_6 ?v3)
   (not (pred_2 ?v3 ?v4)) (not (pred_3 ))))


(:action op_4
:parameters (?v4 ?v10 ?v2)
:precondition (and (pred_10 ?v4) (pred_4 ?v10) (pred_4 ?v2)
                  (pred_5 ?v4) (pred_6 ?v2) (pred_2 ?v10 ?v4))
:effect (and (pred_6 ?v10) (pred_2 ?v2 ?v4)
        (not (pred_6 ?v2)) (not (pred_2 ?v10 ?v4))))

(:action op_3
:parameters (?v4 ?v3)
:precondition (and (pred_10 ?v4) (pred_4 ?v3) 
                  (pred_5 ?v4) (pred_6 ?v3))
:effect (and (pred_3 ) (pred_2 ?v3 ?v4) (not (pred_6 ?v3)))))


	
