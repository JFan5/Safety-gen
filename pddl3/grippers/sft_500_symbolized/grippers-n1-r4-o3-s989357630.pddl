(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_3
obj_02 obj_01 - type_1
obj_05 obj_09 obj_08 obj_10 - type_2
obj_04 obj_06 obj_07 - object)
(:init
(pred_3 obj_03 obj_08)
(pred_2 obj_03 obj_02)
(pred_2 obj_03 obj_01)
(pred_4 obj_04 obj_08)
(pred_4 obj_06 obj_10)
(pred_4 obj_07 obj_10)
)
(:goal
(and
(pred_4 obj_04 obj_08)
(pred_4 obj_06 obj_08)
(pred_4 obj_07 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_03 ?b obj_01))))
)
)