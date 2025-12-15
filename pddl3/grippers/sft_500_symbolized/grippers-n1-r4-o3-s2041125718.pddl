(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_3
obj_08 obj_01 - type_1
obj_04 obj_05 obj_10 obj_02 - type_2
obj_03 obj_09 obj_06 - object)
(:init
(pred_4 obj_07 obj_10)
(pred_2 obj_07 obj_08)
(pred_2 obj_07 obj_01)
(pred_1 obj_03 obj_04)
(pred_1 obj_09 obj_04)
(pred_1 obj_06 obj_02)
)
(:goal
(and
(pred_1 obj_03 obj_04)
(pred_1 obj_09 obj_05)
(pred_1 obj_06 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_07 ?b obj_01))))
)
)