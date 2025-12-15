(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_08 obj_07 - type_3
obj_04 obj_06 obj_10 obj_02 - type_2
obj_01 obj_03 obj_09 - object)
(:init
(pred_3 obj_05 obj_04)
(pred_4 obj_05 obj_08)
(pred_4 obj_05 obj_07)
(pred_2 obj_01 obj_10)
(pred_2 obj_03 obj_10)
(pred_2 obj_09 obj_10)
)
(:goal
(and
(pred_2 obj_01 obj_02)
(pred_2 obj_03 obj_02)
(pred_2 obj_09 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_05 ?b obj_08))))
)
)