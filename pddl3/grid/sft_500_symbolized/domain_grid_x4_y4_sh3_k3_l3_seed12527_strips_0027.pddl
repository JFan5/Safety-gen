(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v5 ?v10)
             (pred_7 ?v13 ?v2)
             (pred_9 ?v5 ?v2)
             (pred_10 ?v11 ?v5 )
	     (pred_12 ?v5)
             (pred_6 ?v9)
             (pred_2 ?v13)
             (pred_11 ?v2)
             (pred_4 ?v5)
             (pred_1 ?v13)
             (pred_8 ?v5)
             (pred_3 ))



(:action op_4
:parameters (?v3 ?v7 ?v1 ?v6)
:precondition (and (pred_6 ?v3) (pred_6 ?v7) (pred_2 ?v1) (pred_11 ?v6)
          (pred_5 ?v3 ?v7) (pred_7 ?v1 ?v6)
                   (pred_9 ?v7 ?v6) (pred_12 ?v3) 
                   (pred_4 ?v7) (pred_1 ?v1))
:effect (and  (pred_8 ?v7) (not (pred_4 ?v7))))


(:action op_5
:parameters (?v3 ?v8)
:precondition (and (pred_6 ?v3) (pred_6 ?v8)
               (pred_12 ?v3) (pred_5 ?v3 ?v8) (pred_8 ?v8))
:effect (and (pred_12 ?v8) (not (pred_12 ?v3))))

(:action op_3
:parameters (?v3 ?v1)
:precondition (and (pred_6 ?v3) (pred_2 ?v1) 
                  (pred_12 ?v3) (pred_10 ?v1 ?v3) (pred_3 ))
:effect (and (pred_1 ?v1)
   (not (pred_10 ?v1 ?v3)) (not (pred_3 ))))


(:action op_2
:parameters (?v3 ?v4 ?v12)
:precondition (and (pred_6 ?v3) (pred_2 ?v4) (pred_2 ?v12)
                  (pred_12 ?v3) (pred_1 ?v12) (pred_10 ?v4 ?v3))
:effect (and (pred_1 ?v4) (pred_10 ?v12 ?v3)
        (not (pred_1 ?v12)) (not (pred_10 ?v4 ?v3))))

(:action op_1
:parameters (?v3 ?v1)
:precondition (and (pred_6 ?v3) (pred_2 ?v1) 
                  (pred_12 ?v3) (pred_1 ?v1))
:effect (and (pred_3 ) (pred_10 ?v1 ?v3) (not (pred_1 ?v1)))))


	
