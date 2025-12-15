(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v12 ?v10)
             (pred_6 ?v13 ?v2)
             (pred_11 ?v12 ?v2)
             (pred_4 ?v4 ?v12 )
	     (pred_8 ?v12)
             (pred_2 ?v8)
             (pred_1 ?v13)
             (pred_7 ?v2)
             (pred_5 ?v12)
             (pred_10 ?v13)
             (pred_9 ?v12)
             (pred_3 ))



(:action op_1
:parameters (?v3 ?v5 ?v7 ?v6)
:precondition (and (pred_2 ?v3) (pred_2 ?v5) (pred_1 ?v7) (pred_7 ?v6)
          (pred_12 ?v3 ?v5) (pred_6 ?v7 ?v6)
                   (pred_11 ?v5 ?v6) (pred_8 ?v3) 
                   (pred_5 ?v5) (pred_10 ?v7))
:effect (and  (pred_9 ?v5) (not (pred_5 ?v5))))


(:action op_5
:parameters (?v3 ?v1)
:precondition (and (pred_2 ?v3) (pred_2 ?v1)
               (pred_8 ?v3) (pred_12 ?v3 ?v1) (pred_9 ?v1))
:effect (and (pred_8 ?v1) (not (pred_8 ?v3))))

(:action op_2
:parameters (?v3 ?v7)
:precondition (and (pred_2 ?v3) (pred_1 ?v7) 
                  (pred_8 ?v3) (pred_4 ?v7 ?v3) (pred_3 ))
:effect (and (pred_10 ?v7)
   (not (pred_4 ?v7 ?v3)) (not (pred_3 ))))


(:action op_3
:parameters (?v3 ?v9 ?v11)
:precondition (and (pred_2 ?v3) (pred_1 ?v9) (pred_1 ?v11)
                  (pred_8 ?v3) (pred_10 ?v11) (pred_4 ?v9 ?v3))
:effect (and (pred_10 ?v9) (pred_4 ?v11 ?v3)
        (not (pred_10 ?v11)) (not (pred_4 ?v9 ?v3))))

(:action op_4
:parameters (?v3 ?v7)
:precondition (and (pred_2 ?v3) (pred_1 ?v7) 
                  (pred_8 ?v3) (pred_10 ?v7))
:effect (and (pred_3 ) (pred_4 ?v7 ?v3) (not (pred_10 ?v7)))))


	
