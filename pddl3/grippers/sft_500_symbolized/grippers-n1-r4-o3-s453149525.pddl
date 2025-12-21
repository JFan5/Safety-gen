(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_02 obj_10 - type_2
obj_04 obj_07 obj_08 obj_05 - type_3
obj_09 obj_03 obj_06 - object)
(:init
(pred_1 obj_01 obj_08)
(pred_3 obj_01 obj_02)
(pred_3 obj_01 obj_10)
(pred_2 obj_09 obj_07)
(pred_2 obj_03 obj_04)
(pred_2 obj_06 obj_04)
)
(:goal
(and
(pred_2 obj_09 obj_04)
(pred_2 obj_03 obj_08)
(pred_2 obj_06 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_01 ?b obj_10))))
)
)