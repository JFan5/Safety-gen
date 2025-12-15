(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_3
obj_03 obj_01 - type_1
obj_02 obj_04 obj_05 obj_06 - type_2
obj_07 obj_08 obj_09 - object)
(:init
(pred_1 obj_10 obj_05)
(pred_3 obj_10 obj_03)
(pred_3 obj_10 obj_01)
(pred_4 obj_07 obj_06)
(pred_4 obj_08 obj_05)
(pred_4 obj_09 obj_06)
)
(:goal
(and
(pred_4 obj_07 obj_05)
(pred_4 obj_08 obj_02)
(pred_4 obj_09 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_10 ?b obj_01))))
)
)