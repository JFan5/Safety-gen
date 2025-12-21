(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v7 ?v13)
             (pred_12 ?v3 ?v11)
             (pred_9 ?v7 ?v11)
             (pred_4 ?v4 ?v7 )
	     (pred_8 ?v7)
             (pred_2 ?v8)
             (pred_10 ?v3)
             (pred_7 ?v11)
             (pred_1 ?v7)
             (pred_5 ?v3)
             (pred_3 ?v7)
             (pred_11 ))



(:action op_2
:parameters (?v1 ?v12 ?v6 ?v10)
:precondition (and (pred_2 ?v1) (pred_2 ?v12) (pred_10 ?v6) (pred_7 ?v10)
          (pred_6 ?v1 ?v12) (pred_12 ?v6 ?v10)
                   (pred_9 ?v12 ?v10) (pred_8 ?v1) 
                   (pred_1 ?v12) (pred_5 ?v6))
:effect (and  (pred_3 ?v12) (not (pred_1 ?v12))))


(:action op_4
:parameters (?v1 ?v9)
:precondition (and (pred_2 ?v1) (pred_2 ?v9)
               (pred_8 ?v1) (pred_6 ?v1 ?v9) (pred_3 ?v9))
:effect (and (pred_8 ?v9) (not (pred_8 ?v1))))

(:action op_3
:parameters (?v1 ?v6)
:precondition (and (pred_2 ?v1) (pred_10 ?v6) 
                  (pred_8 ?v1) (pred_4 ?v6 ?v1) (pred_11 ))
:effect (and (pred_5 ?v6)
   (not (pred_4 ?v6 ?v1)) (not (pred_11 ))))


(:action op_5
:parameters (?v1 ?v2 ?v5)
:precondition (and (pred_2 ?v1) (pred_10 ?v2) (pred_10 ?v5)
                  (pred_8 ?v1) (pred_5 ?v5) (pred_4 ?v2 ?v1))
:effect (and (pred_5 ?v2) (pred_4 ?v5 ?v1)
        (not (pred_5 ?v5)) (not (pred_4 ?v2 ?v1))))

(:action op_1
:parameters (?v1 ?v6)
:precondition (and (pred_2 ?v1) (pred_10 ?v6) 
                  (pred_8 ?v1) (pred_5 ?v6))
:effect (and (pred_11 ) (pred_4 ?v6 ?v1) (not (pred_5 ?v6)))))


	
