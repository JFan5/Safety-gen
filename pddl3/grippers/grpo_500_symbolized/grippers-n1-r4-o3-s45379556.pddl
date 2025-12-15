(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_05 obj_04 - type_3
obj_03 obj_07 obj_08 obj_09 - type_2
obj_02 obj_10 obj_06 - object)
(:init
(pred_3 obj_01 obj_03)
(pred_4 obj_01 obj_05)
(pred_4 obj_01 obj_04)
(pred_2 obj_02 obj_09)
(pred_2 obj_10 obj_08)
(pred_2 obj_06 obj_07)
)
(:goal
(and
(pred_2 obj_02 obj_08)
(pred_2 obj_10 obj_08)
(pred_2 obj_06 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_01 ?b obj_04))))
)
)