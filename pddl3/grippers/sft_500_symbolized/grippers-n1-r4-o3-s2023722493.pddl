(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_03 obj_05 - type_2
obj_02 obj_07 obj_04 obj_08 - type_3
obj_01 obj_10 obj_06 - object)
(:init
(pred_1 obj_09 obj_08)
(pred_3 obj_09 obj_03)
(pred_3 obj_09 obj_05)
(pred_2 obj_01 obj_07)
(pred_2 obj_10 obj_04)
(pred_2 obj_06 obj_08)
)
(:goal
(and
(pred_2 obj_01 obj_04)
(pred_2 obj_10 obj_02)
(pred_2 obj_06 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_09 ?b obj_03))))
)
)