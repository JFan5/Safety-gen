(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v9 ?v10)
             (pred_7 ?v12 ?v11)
             (pred_9 ?v9 ?v11)
             (pred_12 ?v4 ?v9 )
	     (pred_5 ?v9)
             (pred_11 ?v2)
             (pred_1 ?v12)
             (pred_2 ?v11)
             (pred_8 ?v9)
             (pred_3 ?v12)
             (pred_10 ?v9)
             (pred_4 ))



(:action op_1
:parameters (?v3 ?v1 ?v7 ?v6)
:precondition (and (pred_11 ?v3) (pred_11 ?v1) (pred_1 ?v7) (pred_2 ?v6)
          (pred_6 ?v3 ?v1) (pred_7 ?v7 ?v6)
                   (pred_9 ?v1 ?v6) (pred_5 ?v3) 
                   (pred_8 ?v1) (pred_3 ?v7))
:effect (and  (pred_10 ?v1) (not (pred_8 ?v1))))


(:action op_5
:parameters (?v3 ?v5)
:precondition (and (pred_11 ?v3) (pred_11 ?v5)
               (pred_5 ?v3) (pred_6 ?v3 ?v5) (pred_10 ?v5))
:effect (and (pred_5 ?v5) (not (pred_5 ?v3))))

(:action op_3
:parameters (?v3 ?v7)
:precondition (and (pred_11 ?v3) (pred_1 ?v7) 
                  (pred_5 ?v3) (pred_12 ?v7 ?v3) (pred_4 ))
:effect (and (pred_3 ?v7)
   (not (pred_12 ?v7 ?v3)) (not (pred_4 ))))


(:action op_2
:parameters (?v3 ?v8 ?v13)
:precondition (and (pred_11 ?v3) (pred_1 ?v8) (pred_1 ?v13)
                  (pred_5 ?v3) (pred_3 ?v13) (pred_12 ?v8 ?v3))
:effect (and (pred_3 ?v8) (pred_12 ?v13 ?v3)
        (not (pred_3 ?v13)) (not (pred_12 ?v8 ?v3))))

(:action op_4
:parameters (?v3 ?v7)
:precondition (and (pred_11 ?v3) (pred_1 ?v7) 
                  (pred_5 ?v3) (pred_3 ?v7))
:effect (and (pred_4 ) (pred_12 ?v7 ?v3) (not (pred_3 ?v7)))))


	
