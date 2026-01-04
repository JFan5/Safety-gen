(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_10 obj_01 - type_3
obj_04 obj_05 obj_08 obj_07 - type_2
obj_06 obj_03 obj_09 - object)
(:init
(pred_1 obj_02 obj_05)
(pred_3 obj_02 obj_10)
(pred_3 obj_02 obj_01)
(pred_4 obj_06 obj_04)
(pred_4 obj_03 obj_07)
(pred_4 obj_09 obj_04)
)
(:goal
(and
(pred_4 obj_06 obj_07)
(pred_4 obj_03 obj_04)
(pred_4 obj_09 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_02 ?b obj_01))))
)
)