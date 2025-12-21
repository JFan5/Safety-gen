; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 953332984 --problem-name spanner-s2-n2-l3-s953332984
(define (problem spanner-s2-n2-l3-s953332984)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_09 obj_07 - type_5
     obj_01 obj_02 - type_4
     obj_05 obj_08 obj_03 - type_2
     obj_10 obj_06 - type_2
    )
 (:init 
    (pred_2 obj_04 obj_10)
    (pred_2 obj_09 obj_08)
    (pred_1 obj_09)
    (pred_2 obj_07 obj_08)
    (pred_1 obj_07)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_06)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_06)
    (pred_6 obj_10 obj_05)
    (pred_6 obj_03 obj_06)
    (pred_6 obj_05 obj_08)
    (pred_6 obj_08 obj_03)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
