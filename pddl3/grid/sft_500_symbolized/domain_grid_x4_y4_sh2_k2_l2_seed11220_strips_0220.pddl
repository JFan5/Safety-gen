(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v13)
             (pred_6 ?v9 ?v8)
             (pred_12 ?v4 ?v8)
             (pred_11 ?v10 ?v4 )
	     (pred_1 ?v4)
             (pred_7 ?v11)
             (pred_3 ?v9)
             (pred_8 ?v8)
             (pred_4 ?v4)
             (pred_5 ?v9)
             (pred_9 ?v4)
             (pred_2 ))



(:action op_1
:parameters (?v7 ?v12 ?v1 ?v6)
:precondition (and (pred_7 ?v7) (pred_7 ?v12) (pred_3 ?v1) (pred_8 ?v6)
          (pred_10 ?v7 ?v12) (pred_6 ?v1 ?v6)
                   (pred_12 ?v12 ?v6) (pred_1 ?v7) 
                   (pred_4 ?v12) (pred_5 ?v1))
:effect (and  (pred_9 ?v12) (not (pred_4 ?v12))))


(:action op_5
:parameters (?v7 ?v2)
:precondition (and (pred_7 ?v7) (pred_7 ?v2)
               (pred_1 ?v7) (pred_10 ?v7 ?v2) (pred_9 ?v2))
:effect (and (pred_1 ?v2) (not (pred_1 ?v7))))

(:action op_2
:parameters (?v7 ?v1)
:precondition (and (pred_7 ?v7) (pred_3 ?v1) 
                  (pred_1 ?v7) (pred_11 ?v1 ?v7) (pred_2 ))
:effect (and (pred_5 ?v1)
   (not (pred_11 ?v1 ?v7)) (not (pred_2 ))))


(:action op_3
:parameters (?v7 ?v5 ?v3)
:precondition (and (pred_7 ?v7) (pred_3 ?v5) (pred_3 ?v3)
                  (pred_1 ?v7) (pred_5 ?v3) (pred_11 ?v5 ?v7))
:effect (and (pred_5 ?v5) (pred_11 ?v3 ?v7)
        (not (pred_5 ?v3)) (not (pred_11 ?v5 ?v7))))

(:action op_4
:parameters (?v7 ?v1)
:precondition (and (pred_7 ?v7) (pred_3 ?v1) 
                  (pred_1 ?v7) (pred_5 ?v1))
:effect (and (pred_2 ) (pred_11 ?v1 ?v7) (not (pred_5 ?v1)))))


	
