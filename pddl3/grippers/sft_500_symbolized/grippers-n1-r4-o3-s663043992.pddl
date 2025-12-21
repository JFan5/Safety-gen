(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_04 obj_08 - type_2
obj_01 obj_03 obj_02 obj_10 - type_3
obj_09 obj_07 obj_06 - object)
(:init
(pred_1 obj_05 obj_01)
(pred_3 obj_05 obj_04)
(pred_3 obj_05 obj_08)
(pred_2 obj_09 obj_10)
(pred_2 obj_07 obj_02)
(pred_2 obj_06 obj_02)
)
(:goal
(and
(pred_2 obj_09 obj_03)
(pred_2 obj_07 obj_01)
(pred_2 obj_06 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_08))))
)
)