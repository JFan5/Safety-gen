(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v2 ?v5)
             (pred_10 ?v8 ?v7)
             (pred_5 ?v2 ?v7)
             (pred_6 ?v13 ?v2 )
	     (pred_4 ?v2)
             (pred_7 ?v1)
             (pred_12 ?v8)
             (pred_9 ?v7)
             (pred_11 ?v2)
             (pred_3 ?v8)
             (pred_8 ?v2)
             (pred_1 ))



(:action op_2
:parameters (?v11 ?v3 ?v9 ?v10)
:precondition (and (pred_7 ?v11) (pred_7 ?v3) (pred_12 ?v9) (pred_9 ?v10)
          (pred_2 ?v11 ?v3) (pred_10 ?v9 ?v10)
                   (pred_5 ?v3 ?v10) (pred_4 ?v11) 
                   (pred_11 ?v3) (pred_3 ?v9))
:effect (and  (pred_8 ?v3) (not (pred_11 ?v3))))


(:action op_1
:parameters (?v11 ?v4)
:precondition (and (pred_7 ?v11) (pred_7 ?v4)
               (pred_4 ?v11) (pred_2 ?v11 ?v4) (pred_8 ?v4))
:effect (and (pred_4 ?v4) (not (pred_4 ?v11))))

(:action op_5
:parameters (?v11 ?v9)
:precondition (and (pred_7 ?v11) (pred_12 ?v9) 
                  (pred_4 ?v11) (pred_6 ?v9 ?v11) (pred_1 ))
:effect (and (pred_3 ?v9)
   (not (pred_6 ?v9 ?v11)) (not (pred_1 ))))


(:action op_3
:parameters (?v11 ?v6 ?v12)
:precondition (and (pred_7 ?v11) (pred_12 ?v6) (pred_12 ?v12)
                  (pred_4 ?v11) (pred_3 ?v12) (pred_6 ?v6 ?v11))
:effect (and (pred_3 ?v6) (pred_6 ?v12 ?v11)
        (not (pred_3 ?v12)) (not (pred_6 ?v6 ?v11))))

(:action op_4
:parameters (?v11 ?v9)
:precondition (and (pred_7 ?v11) (pred_12 ?v9) 
                  (pred_4 ?v11) (pred_3 ?v9))
:effect (and (pred_1 ) (pred_6 ?v9 ?v11) (not (pred_3 ?v9)))))


	
