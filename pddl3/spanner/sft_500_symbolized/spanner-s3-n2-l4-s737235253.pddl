; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 737235253 --problem-name spanner-s3-n2-l4-s737235253
(define (problem spanner-s3-n2-l4-s737235253)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_09 obj_11 obj_03 - type_2
     obj_05 obj_07 - type_1
     obj_01 obj_08 obj_04 obj_10 - type_5
     obj_12 obj_06 - type_5
    )
 (:init 
    (pred_6 obj_02 obj_12)
    (pred_6 obj_09 obj_10)
    (pred_5 obj_09)
    (pred_6 obj_11 obj_10)
    (pred_5 obj_11)
    (pred_6 obj_03 obj_04)
    (pred_5 obj_03)
    (pred_3 obj_05)
    (pred_6 obj_05 obj_06)
    (pred_3 obj_07)
    (pred_6 obj_07 obj_06)
    (pred_2 obj_12 obj_01)
    (pred_2 obj_10 obj_06)
    (pred_2 obj_01 obj_08)
    (pred_2 obj_08 obj_04)
    (pred_2 obj_04 obj_10)
)
 (:goal
  (and
   (pred_4 obj_05)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_05)) (not (pred_4 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
