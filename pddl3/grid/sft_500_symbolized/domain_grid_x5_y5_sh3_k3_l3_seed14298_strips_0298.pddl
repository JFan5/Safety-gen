(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v12 ?v4)
             (pred_4 ?v3 ?v1)
             (pred_2 ?v12 ?v1)
             (pred_12 ?v13 ?v12 )
	     (pred_8 ?v12)
             (pred_1 ?v7)
             (pred_5 ?v3)
             (pred_11 ?v1)
             (pred_6 ?v12)
             (pred_3 ?v3)
             (pred_10 ?v12)
             (pred_9 ))



(:action op_1
:parameters (?v11 ?v10 ?v6 ?v5)
:precondition (and (pred_1 ?v11) (pred_1 ?v10) (pred_5 ?v6) (pred_11 ?v5)
          (pred_7 ?v11 ?v10) (pred_4 ?v6 ?v5)
                   (pred_2 ?v10 ?v5) (pred_8 ?v11) 
                   (pred_6 ?v10) (pred_3 ?v6))
:effect (and  (pred_10 ?v10) (not (pred_6 ?v10))))


(:action op_4
:parameters (?v11 ?v8)
:precondition (and (pred_1 ?v11) (pred_1 ?v8)
               (pred_8 ?v11) (pred_7 ?v11 ?v8) (pred_10 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v11))))

(:action op_3
:parameters (?v11 ?v6)
:precondition (and (pred_1 ?v11) (pred_5 ?v6) 
                  (pred_8 ?v11) (pred_12 ?v6 ?v11) (pred_9 ))
:effect (and (pred_3 ?v6)
   (not (pred_12 ?v6 ?v11)) (not (pred_9 ))))


(:action op_5
:parameters (?v11 ?v2 ?v9)
:precondition (and (pred_1 ?v11) (pred_5 ?v2) (pred_5 ?v9)
                  (pred_8 ?v11) (pred_3 ?v9) (pred_12 ?v2 ?v11))
:effect (and (pred_3 ?v2) (pred_12 ?v9 ?v11)
        (not (pred_3 ?v9)) (not (pred_12 ?v2 ?v11))))

(:action op_2
:parameters (?v11 ?v6)
:precondition (and (pred_1 ?v11) (pred_5 ?v6) 
                  (pred_8 ?v11) (pred_3 ?v6))
:effect (and (pred_9 ) (pred_12 ?v6 ?v11) (not (pred_3 ?v6)))))


	
