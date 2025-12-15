; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1010907011 --problem-name spanner-s4-n3-l4-s1010907011
(define (problem spanner-s4-n3-l4-s1010907011)
 (:domain spanner)
 (:objects 
     obj_03 - type_3
     obj_09 obj_05 obj_06 obj_07 - type_1
     obj_11 obj_12 obj_02 - type_2
     obj_01 obj_10 obj_13 obj_08 - type_5
     obj_14 obj_04 - type_5
    )
 (:init 
    (pred_6 obj_03 obj_14)
    (pred_6 obj_09 obj_13)
    (pred_5 obj_09)
    (pred_6 obj_05 obj_01)
    (pred_5 obj_05)
    (pred_6 obj_06 obj_10)
    (pred_5 obj_06)
    (pred_6 obj_07 obj_13)
    (pred_5 obj_07)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_04)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_04)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_04)
    (pred_2 obj_14 obj_01)
    (pred_2 obj_08 obj_04)
    (pred_2 obj_01 obj_10)
    (pred_2 obj_10 obj_13)
    (pred_2 obj_13 obj_08)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_12)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_14)))
  )
)
)
