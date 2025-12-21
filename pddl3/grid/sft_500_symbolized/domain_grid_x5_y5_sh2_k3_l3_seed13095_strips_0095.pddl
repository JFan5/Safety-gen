(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v8 ?v2)
             (pred_12 ?v7 ?v4)
             (pred_5 ?v8 ?v4)
             (pred_7 ?v13 ?v8 )
	     (pred_4 ?v8)
             (pred_1 ?v1)
             (pred_3 ?v7)
             (pred_9 ?v4)
             (pred_8 ?v8)
             (pred_2 ?v7)
             (pred_10 ?v8)
             (pred_6 ))



(:action op_3
:parameters (?v5 ?v11 ?v3 ?v6)
:precondition (and (pred_1 ?v5) (pred_1 ?v11) (pred_3 ?v3) (pred_9 ?v6)
          (pred_11 ?v5 ?v11) (pred_12 ?v3 ?v6)
                   (pred_5 ?v11 ?v6) (pred_4 ?v5) 
                   (pred_8 ?v11) (pred_2 ?v3))
:effect (and  (pred_10 ?v11) (not (pred_8 ?v11))))


(:action op_5
:parameters (?v5 ?v9)
:precondition (and (pred_1 ?v5) (pred_1 ?v9)
               (pred_4 ?v5) (pred_11 ?v5 ?v9) (pred_10 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v5))))

(:action op_1
:parameters (?v5 ?v3)
:precondition (and (pred_1 ?v5) (pred_3 ?v3) 
                  (pred_4 ?v5) (pred_7 ?v3 ?v5) (pred_6 ))
:effect (and (pred_2 ?v3)
   (not (pred_7 ?v3 ?v5)) (not (pred_6 ))))


(:action op_2
:parameters (?v5 ?v12 ?v10)
:precondition (and (pred_1 ?v5) (pred_3 ?v12) (pred_3 ?v10)
                  (pred_4 ?v5) (pred_2 ?v10) (pred_7 ?v12 ?v5))
:effect (and (pred_2 ?v12) (pred_7 ?v10 ?v5)
        (not (pred_2 ?v10)) (not (pred_7 ?v12 ?v5))))

(:action op_4
:parameters (?v5 ?v3)
:precondition (and (pred_1 ?v5) (pred_3 ?v3) 
                  (pred_4 ?v5) (pred_2 ?v3))
:effect (and (pred_6 ) (pred_7 ?v3 ?v5) (not (pred_2 ?v3)))))


	
