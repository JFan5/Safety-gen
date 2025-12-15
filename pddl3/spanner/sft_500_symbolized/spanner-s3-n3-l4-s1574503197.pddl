; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1574503197 --problem-name spanner-s3-n3-l4-s1574503197
(define (problem spanner-s3-n3-l4-s1574503197)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_01 obj_13 obj_08 - type_2
     obj_02 obj_11 obj_10 - type_3
     obj_03 obj_04 obj_05 obj_07 - type_4
     obj_12 obj_09 - type_4
    )
 (:init 
    (pred_3 obj_06 obj_12)
    (pred_3 obj_01 obj_03)
    (pred_5 obj_01)
    (pred_3 obj_13 obj_03)
    (pred_5 obj_13)
    (pred_3 obj_08 obj_03)
    (pred_5 obj_08)
    (pred_4 obj_02)
    (pred_3 obj_02 obj_09)
    (pred_4 obj_11)
    (pred_3 obj_11 obj_09)
    (pred_4 obj_10)
    (pred_3 obj_10 obj_09)
    (pred_2 obj_12 obj_03)
    (pred_2 obj_07 obj_09)
    (pred_2 obj_03 obj_04)
    (pred_2 obj_04 obj_05)
    (pred_2 obj_05 obj_07)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_11)
   (pred_6 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_12)))
  )
)
)
