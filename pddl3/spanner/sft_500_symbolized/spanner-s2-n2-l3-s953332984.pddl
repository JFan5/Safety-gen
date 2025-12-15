; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 953332984 --problem-name spanner-s2-n2-l3-s953332984
(define (problem spanner-s2-n2-l3-s953332984)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_03 obj_01 - type_4
     obj_09 obj_02 - type_5
     obj_10 obj_08 obj_05 - type_1
     obj_07 obj_04 - type_1
    )
 (:init 
    (pred_2 obj_06 obj_07)
    (pred_2 obj_03 obj_08)
    (pred_4 obj_03)
    (pred_2 obj_01 obj_08)
    (pred_4 obj_01)
    (pred_1 obj_09)
    (pred_2 obj_09 obj_04)
    (pred_1 obj_02)
    (pred_2 obj_02 obj_04)
    (pred_6 obj_07 obj_10)
    (pred_6 obj_05 obj_04)
    (pred_6 obj_10 obj_08)
    (pred_6 obj_08 obj_05)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_09)) (not (pred_3 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_07)))
  )
)
)
