(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v9 ?v7)
             (pred_8 ?v5 ?v4)
             (pred_9 ?v9 ?v4)
             (pred_4 ?v1 ?v9 )
	     (pred_10 ?v9)
             (pred_5 ?v10)
             (pred_7 ?v5)
             (pred_1 ?v4)
             (pred_12 ?v9)
             (pred_2 ?v5)
             (pred_3 ?v9)
             (pred_11 ))



(:action op_5
:parameters (?v11 ?v8 ?v2 ?v3)
:precondition (and (pred_5 ?v11) (pred_5 ?v8) (pred_7 ?v2) (pred_1 ?v3)
          (pred_6 ?v11 ?v8) (pred_8 ?v2 ?v3)
                   (pred_9 ?v8 ?v3) (pred_10 ?v11) 
                   (pred_12 ?v8) (pred_2 ?v2))
:effect (and  (pred_3 ?v8) (not (pred_12 ?v8))))


(:action op_4
:parameters (?v11 ?v6)
:precondition (and (pred_5 ?v11) (pred_5 ?v6)
               (pred_10 ?v11) (pred_6 ?v11 ?v6) (pred_3 ?v6))
:effect (and (pred_10 ?v6) (not (pred_10 ?v11))))

(:action op_2
:parameters (?v11 ?v2)
:precondition (and (pred_5 ?v11) (pred_7 ?v2) 
                  (pred_10 ?v11) (pred_4 ?v2 ?v11) (pred_11 ))
:effect (and (pred_2 ?v2)
   (not (pred_4 ?v2 ?v11)) (not (pred_11 ))))


(:action op_1
:parameters (?v11 ?v13 ?v12)
:precondition (and (pred_5 ?v11) (pred_7 ?v13) (pred_7 ?v12)
                  (pred_10 ?v11) (pred_2 ?v12) (pred_4 ?v13 ?v11))
:effect (and (pred_2 ?v13) (pred_4 ?v12 ?v11)
        (not (pred_2 ?v12)) (not (pred_4 ?v13 ?v11))))

(:action op_3
:parameters (?v11 ?v2)
:precondition (and (pred_5 ?v11) (pred_7 ?v2) 
                  (pred_10 ?v11) (pred_2 ?v2))
:effect (and (pred_11 ) (pred_4 ?v2 ?v11) (not (pred_2 ?v2)))))


	
