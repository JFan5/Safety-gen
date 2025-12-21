; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 138174721 --problem-name spanner-s4-n3-l4-s138174721
(define (problem spanner-s4-n3-l4-s138174721)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_07 obj_01 obj_12 obj_14 - type_3
     obj_05 obj_13 obj_08 - type_1
     obj_04 obj_09 obj_02 obj_11 - type_2
     obj_10 obj_06 - type_2
    )
 (:init 
    (pred_6 obj_03 obj_10)
    (pred_6 obj_07 obj_02)
    (pred_5 obj_07)
    (pred_6 obj_01 obj_09)
    (pred_5 obj_01)
    (pred_6 obj_12 obj_09)
    (pred_5 obj_12)
    (pred_6 obj_14 obj_02)
    (pred_5 obj_14)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_06)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_06)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_06)
    (pred_3 obj_10 obj_04)
    (pred_3 obj_11 obj_06)
    (pred_3 obj_04 obj_09)
    (pred_3 obj_09 obj_02)
    (pred_3 obj_02 obj_11)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_13)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_10)))
  )
)
)
