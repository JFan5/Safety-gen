(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v11)
             (pred_8 ?v10 ?v12)
             (pred_6 ?v6 ?v12)
             (pred_12 ?v13 ?v6 )
	     (pred_5 ?v6)
             (pred_2 ?v5)
             (pred_4 ?v10)
             (pred_9 ?v12)
             (pred_3 ?v6)
             (pred_7 ?v10)
             (pred_11 ?v6)
             (pred_1 ))



(:action op_1
:parameters (?v4 ?v1 ?v3 ?v9)
:precondition (and (pred_2 ?v4) (pred_2 ?v1) (pred_4 ?v3) (pred_9 ?v9)
          (pred_10 ?v4 ?v1) (pred_8 ?v3 ?v9)
                   (pred_6 ?v1 ?v9) (pred_5 ?v4) 
                   (pred_3 ?v1) (pred_7 ?v3))
:effect (and  (pred_11 ?v1) (not (pred_3 ?v1))))


(:action op_2
:parameters (?v4 ?v7)
:precondition (and (pred_2 ?v4) (pred_2 ?v7)
               (pred_5 ?v4) (pred_10 ?v4 ?v7) (pred_11 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v4))))

(:action op_3
:parameters (?v4 ?v3)
:precondition (and (pred_2 ?v4) (pred_4 ?v3) 
                  (pred_5 ?v4) (pred_12 ?v3 ?v4) (pred_1 ))
:effect (and (pred_7 ?v3)
   (not (pred_12 ?v3 ?v4)) (not (pred_1 ))))


(:action op_5
:parameters (?v4 ?v8 ?v2)
:precondition (and (pred_2 ?v4) (pred_4 ?v8) (pred_4 ?v2)
                  (pred_5 ?v4) (pred_7 ?v2) (pred_12 ?v8 ?v4))
:effect (and (pred_7 ?v8) (pred_12 ?v2 ?v4)
        (not (pred_7 ?v2)) (not (pred_12 ?v8 ?v4))))

(:action op_4
:parameters (?v4 ?v3)
:precondition (and (pred_2 ?v4) (pred_4 ?v3) 
                  (pred_5 ?v4) (pred_7 ?v3))
:effect (and (pred_1 ) (pred_12 ?v3 ?v4) (not (pred_7 ?v3)))))


	
