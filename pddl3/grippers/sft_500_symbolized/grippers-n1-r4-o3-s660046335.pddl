(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_3
obj_07 obj_10 - type_1
obj_03 obj_05 obj_01 obj_02 - type_2
obj_09 obj_08 obj_06 - object)
(:init
(pred_2 obj_04 obj_03)
(pred_4 obj_04 obj_07)
(pred_4 obj_04 obj_10)
(pred_1 obj_09 obj_03)
(pred_1 obj_08 obj_05)
(pred_1 obj_06 obj_05)
)
(:goal
(and
(pred_1 obj_09 obj_02)
(pred_1 obj_08 obj_03)
(pred_1 obj_06 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_04 ?b obj_10))))
)
)