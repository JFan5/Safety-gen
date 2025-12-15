(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v13 ?v1)
             (pred_1 ?v2 ?v7)
             (pred_6 ?v13 ?v7)
             (pred_7 ?v9 ?v13 )
	     (pred_2 ?v13)
             (pred_10 ?v11)
             (pred_4 ?v2)
             (pred_9 ?v7)
             (pred_8 ?v13)
             (pred_3 ?v2)
             (pred_12 ?v13)
             (pred_11 ))



(:action op_5
:parameters (?v10 ?v3 ?v6 ?v12)
:precondition (and (pred_10 ?v10) (pred_10 ?v3) (pred_4 ?v6) (pred_9 ?v12)
          (pred_5 ?v10 ?v3) (pred_1 ?v6 ?v12)
                   (pred_6 ?v3 ?v12) (pred_2 ?v10) 
                   (pred_8 ?v3) (pred_3 ?v6))
:effect (and  (pred_12 ?v3) (not (pred_8 ?v3))))


(:action op_3
:parameters (?v10 ?v8)
:precondition (and (pred_10 ?v10) (pred_10 ?v8)
               (pred_2 ?v10) (pred_5 ?v10 ?v8) (pred_12 ?v8))
:effect (and (pred_2 ?v8) (not (pred_2 ?v10))))

(:action op_1
:parameters (?v10 ?v6)
:precondition (and (pred_10 ?v10) (pred_4 ?v6) 
                  (pred_2 ?v10) (pred_7 ?v6 ?v10) (pred_11 ))
:effect (and (pred_3 ?v6)
   (not (pred_7 ?v6 ?v10)) (not (pred_11 ))))


(:action op_2
:parameters (?v10 ?v4 ?v5)
:precondition (and (pred_10 ?v10) (pred_4 ?v4) (pred_4 ?v5)
                  (pred_2 ?v10) (pred_3 ?v5) (pred_7 ?v4 ?v10))
:effect (and (pred_3 ?v4) (pred_7 ?v5 ?v10)
        (not (pred_3 ?v5)) (not (pred_7 ?v4 ?v10))))

(:action op_4
:parameters (?v10 ?v6)
:precondition (and (pred_10 ?v10) (pred_4 ?v6) 
                  (pred_2 ?v10) (pred_3 ?v6))
:effect (and (pred_11 ) (pred_7 ?v6 ?v10) (not (pred_3 ?v6)))))


	
