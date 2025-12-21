(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v12)
             (pred_4 ?v11 ?v8)
             (pred_9 ?v13 ?v8)
             (pred_10 ?v9 ?v13 )
	     (pred_6 ?v13)
             (pred_8 ?v4)
             (pred_11 ?v11)
             (pred_1 ?v8)
             (pred_12 ?v13)
             (pred_7 ?v11)
             (pred_5 ?v13)
             (pred_3 ))



(:action op_4
:parameters (?v7 ?v2 ?v6 ?v10)
:precondition (and (pred_8 ?v7) (pred_8 ?v2) (pred_11 ?v6) (pred_1 ?v10)
          (pred_2 ?v7 ?v2) (pred_4 ?v6 ?v10)
                   (pred_9 ?v2 ?v10) (pred_6 ?v7) 
                   (pred_12 ?v2) (pred_7 ?v6))
:effect (and  (pred_5 ?v2) (not (pred_12 ?v2))))


(:action op_2
:parameters (?v7 ?v5)
:precondition (and (pred_8 ?v7) (pred_8 ?v5)
               (pred_6 ?v7) (pred_2 ?v7 ?v5) (pred_5 ?v5))
:effect (and (pred_6 ?v5) (not (pred_6 ?v7))))

(:action op_1
:parameters (?v7 ?v6)
:precondition (and (pred_8 ?v7) (pred_11 ?v6) 
                  (pred_6 ?v7) (pred_10 ?v6 ?v7) (pred_3 ))
:effect (and (pred_7 ?v6)
   (not (pred_10 ?v6 ?v7)) (not (pred_3 ))))


(:action op_5
:parameters (?v7 ?v1 ?v3)
:precondition (and (pred_8 ?v7) (pred_11 ?v1) (pred_11 ?v3)
                  (pred_6 ?v7) (pred_7 ?v3) (pred_10 ?v1 ?v7))
:effect (and (pred_7 ?v1) (pred_10 ?v3 ?v7)
        (not (pred_7 ?v3)) (not (pred_10 ?v1 ?v7))))

(:action op_3
:parameters (?v7 ?v6)
:precondition (and (pred_8 ?v7) (pred_11 ?v6) 
                  (pred_6 ?v7) (pred_7 ?v6))
:effect (and (pred_3 ) (pred_10 ?v6 ?v7) (not (pred_7 ?v6)))))


	
