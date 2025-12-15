; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1187492693 --problem-name spanner-s4-n3-l4-s1187492693
(define (problem spanner-s4-n3-l4-s1187492693)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_05 obj_13 obj_02 obj_14 - type_1
     obj_04 obj_09 obj_01 - type_2
     obj_06 obj_10 obj_12 obj_07 - type_5
     obj_03 obj_08 - type_5
    )
 (:init 
    (pred_3 obj_11 obj_03)
    (pred_3 obj_05 obj_06)
    (pred_4 obj_05)
    (pred_3 obj_13 obj_12)
    (pred_4 obj_13)
    (pred_3 obj_02 obj_12)
    (pred_4 obj_02)
    (pred_3 obj_14 obj_10)
    (pred_4 obj_14)
    (pred_2 obj_04)
    (pred_3 obj_04 obj_08)
    (pred_2 obj_09)
    (pred_3 obj_09 obj_08)
    (pred_2 obj_01)
    (pred_3 obj_01 obj_08)
    (pred_5 obj_03 obj_06)
    (pred_5 obj_07 obj_08)
    (pred_5 obj_06 obj_10)
    (pred_5 obj_10 obj_12)
    (pred_5 obj_12 obj_07)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_09)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
