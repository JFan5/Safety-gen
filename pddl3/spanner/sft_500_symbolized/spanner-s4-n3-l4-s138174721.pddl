; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 138174721 --problem-name spanner-s4-n3-l4-s138174721
(define (problem spanner-s4-n3-l4-s138174721)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_03 obj_13 obj_06 obj_12 - type_3
     obj_09 obj_01 obj_02 - type_1
     obj_08 obj_14 obj_07 obj_05 - type_2
     obj_11 obj_04 - type_2
    )
 (:init 
    (pred_5 obj_10 obj_11)
    (pred_5 obj_03 obj_07)
    (pred_6 obj_03)
    (pred_5 obj_13 obj_14)
    (pred_6 obj_13)
    (pred_5 obj_06 obj_14)
    (pred_6 obj_06)
    (pred_5 obj_12 obj_07)
    (pred_6 obj_12)
    (pred_2 obj_09)
    (pred_5 obj_09 obj_04)
    (pred_2 obj_01)
    (pred_5 obj_01 obj_04)
    (pred_2 obj_02)
    (pred_5 obj_02 obj_04)
    (pred_1 obj_11 obj_08)
    (pred_1 obj_05 obj_04)
    (pred_1 obj_08 obj_14)
    (pred_1 obj_14 obj_07)
    (pred_1 obj_07 obj_05)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_01)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_11)))
  )
)
)
