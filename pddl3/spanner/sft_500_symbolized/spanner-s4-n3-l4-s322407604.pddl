; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 322407604 --problem-name spanner-s4-n3-l4-s322407604
(define (problem spanner-s4-n3-l4-s322407604)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_05 obj_14 obj_02 obj_09 - type_3
     obj_11 obj_03 obj_04 - type_2
     obj_07 obj_01 obj_12 obj_06 - type_4
     obj_13 obj_10 - type_4
    )
 (:init 
    (pred_6 obj_08 obj_13)
    (pred_6 obj_05 obj_12)
    (pred_2 obj_05)
    (pred_6 obj_14 obj_01)
    (pred_2 obj_14)
    (pred_6 obj_02 obj_12)
    (pred_2 obj_02)
    (pred_6 obj_09 obj_01)
    (pred_2 obj_09)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_10)
    (pred_3 obj_03)
    (pred_6 obj_03 obj_10)
    (pred_3 obj_04)
    (pred_6 obj_04 obj_10)
    (pred_5 obj_13 obj_07)
    (pred_5 obj_06 obj_10)
    (pred_5 obj_07 obj_01)
    (pred_5 obj_01 obj_12)
    (pred_5 obj_12 obj_06)
)
 (:goal
  (and
   (pred_4 obj_11)
   (pred_4 obj_03)
   (pred_4 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_03)) (not (pred_4 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_13)))
  )
)
)
