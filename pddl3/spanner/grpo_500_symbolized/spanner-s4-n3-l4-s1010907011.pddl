; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1010907011 --problem-name spanner-s4-n3-l4-s1010907011
(define (problem spanner-s4-n3-l4-s1010907011)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_07 obj_13 obj_05 obj_04 - type_3
     obj_11 obj_02 obj_14 - type_1
     obj_03 obj_10 obj_09 obj_06 - type_2
     obj_08 obj_01 - type_2
    )
 (:init 
    (pred_6 obj_12 obj_08)
    (pred_6 obj_07 obj_09)
    (pred_5 obj_07)
    (pred_6 obj_13 obj_03)
    (pred_5 obj_13)
    (pred_6 obj_05 obj_10)
    (pred_5 obj_05)
    (pred_6 obj_04 obj_09)
    (pred_5 obj_04)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_01)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_01)
    (pred_4 obj_14)
    (pred_6 obj_14 obj_01)
    (pred_3 obj_08 obj_03)
    (pred_3 obj_06 obj_01)
    (pred_3 obj_03 obj_10)
    (pred_3 obj_10 obj_09)
    (pred_3 obj_09 obj_06)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_02)
   (pred_1 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_14))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
