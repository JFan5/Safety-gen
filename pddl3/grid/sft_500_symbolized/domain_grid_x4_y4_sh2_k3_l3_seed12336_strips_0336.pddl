(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v13 ?v11)
             (pred_2 ?v5 ?v1)
             (pred_8 ?v13 ?v1)
             (pred_5 ?v4 ?v13 )
	     (pred_10 ?v13)
             (pred_4 ?v12)
             (pred_12 ?v5)
             (pred_7 ?v1)
             (pred_1 ?v13)
             (pred_6 ?v5)
             (pred_3 ?v13)
             (pred_9 ))



(:action op_5
:parameters (?v3 ?v6 ?v7 ?v10)
:precondition (and (pred_4 ?v3) (pred_4 ?v6) (pred_12 ?v7) (pred_7 ?v10)
          (pred_11 ?v3 ?v6) (pred_2 ?v7 ?v10)
                   (pred_8 ?v6 ?v10) (pred_10 ?v3) 
                   (pred_1 ?v6) (pred_6 ?v7))
:effect (and  (pred_3 ?v6) (not (pred_1 ?v6))))


(:action op_4
:parameters (?v3 ?v8)
:precondition (and (pred_4 ?v3) (pred_4 ?v8)
               (pred_10 ?v3) (pred_11 ?v3 ?v8) (pred_3 ?v8))
:effect (and (pred_10 ?v8) (not (pred_10 ?v3))))

(:action op_1
:parameters (?v3 ?v7)
:precondition (and (pred_4 ?v3) (pred_12 ?v7) 
                  (pred_10 ?v3) (pred_5 ?v7 ?v3) (pred_9 ))
:effect (and (pred_6 ?v7)
   (not (pred_5 ?v7 ?v3)) (not (pred_9 ))))


(:action op_3
:parameters (?v3 ?v9 ?v2)
:precondition (and (pred_4 ?v3) (pred_12 ?v9) (pred_12 ?v2)
                  (pred_10 ?v3) (pred_6 ?v2) (pred_5 ?v9 ?v3))
:effect (and (pred_6 ?v9) (pred_5 ?v2 ?v3)
        (not (pred_6 ?v2)) (not (pred_5 ?v9 ?v3))))

(:action op_2
:parameters (?v3 ?v7)
:precondition (and (pred_4 ?v3) (pred_12 ?v7) 
                  (pred_10 ?v3) (pred_6 ?v7))
:effect (and (pred_9 ) (pred_5 ?v7 ?v3) (not (pred_6 ?v7)))))


	
