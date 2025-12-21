(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v9 ?v7)
             (pred_7 ?v5 ?v4)
             (pred_9 ?v9 ?v4)
             (pred_11 ?v8 ?v9 )
	     (pred_6 ?v9)
             (pred_10 ?v1)
             (pred_3 ?v5)
             (pred_2 ?v4)
             (pred_5 ?v9)
             (pred_1 ?v5)
             (pred_8 ?v9)
             (pred_12 ))



(:action op_2
:parameters (?v11 ?v10 ?v3 ?v2)
:precondition (and (pred_10 ?v11) (pred_10 ?v10) (pred_3 ?v3) (pred_2 ?v2)
          (pred_4 ?v11 ?v10) (pred_7 ?v3 ?v2)
                   (pred_9 ?v10 ?v2) (pred_6 ?v11) 
                   (pred_5 ?v10) (pred_1 ?v3))
:effect (and  (pred_8 ?v10) (not (pred_5 ?v10))))


(:action op_5
:parameters (?v11 ?v6)
:precondition (and (pred_10 ?v11) (pred_10 ?v6)
               (pred_6 ?v11) (pred_4 ?v11 ?v6) (pred_8 ?v6))
:effect (and (pred_6 ?v6) (not (pred_6 ?v11))))

(:action op_4
:parameters (?v11 ?v3)
:precondition (and (pred_10 ?v11) (pred_3 ?v3) 
                  (pred_6 ?v11) (pred_11 ?v3 ?v11) (pred_12 ))
:effect (and (pred_1 ?v3)
   (not (pred_11 ?v3 ?v11)) (not (pred_12 ))))


(:action op_3
:parameters (?v11 ?v12 ?v13)
:precondition (and (pred_10 ?v11) (pred_3 ?v12) (pred_3 ?v13)
                  (pred_6 ?v11) (pred_1 ?v13) (pred_11 ?v12 ?v11))
:effect (and (pred_1 ?v12) (pred_11 ?v13 ?v11)
        (not (pred_1 ?v13)) (not (pred_11 ?v12 ?v11))))

(:action op_1
:parameters (?v11 ?v3)
:precondition (and (pred_10 ?v11) (pred_3 ?v3) 
                  (pred_6 ?v11) (pred_1 ?v3))
:effect (and (pred_12 ) (pred_11 ?v3 ?v11) (not (pred_1 ?v3)))))


	
