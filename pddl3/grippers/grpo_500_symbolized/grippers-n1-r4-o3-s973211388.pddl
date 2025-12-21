(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_01 obj_03 - type_3
obj_10 obj_04 obj_06 obj_05 - type_2
obj_09 obj_07 obj_02 - object)
(:init
(pred_4 obj_08 obj_05)
(pred_2 obj_08 obj_01)
(pred_2 obj_08 obj_03)
(pred_3 obj_09 obj_05)
(pred_3 obj_07 obj_04)
(pred_3 obj_02 obj_06)
)
(:goal
(and
(pred_3 obj_09 obj_10)
(pred_3 obj_07 obj_10)
(pred_3 obj_02 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_08 ?b obj_01))))
)
)