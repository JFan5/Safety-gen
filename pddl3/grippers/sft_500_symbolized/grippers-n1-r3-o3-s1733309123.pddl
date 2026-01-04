(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_01 - type_3
obj_04 obj_06 - type_2
obj_02 obj_03 obj_07 - type_1
obj_08 obj_09 obj_05 - object)
(:init
(pred_3 obj_01 obj_02)
(pred_2 obj_01 obj_04)
(pred_2 obj_01 obj_06)
(pred_4 obj_08 obj_03)
(pred_4 obj_09 obj_03)
(pred_4 obj_05 obj_07)
)
(:goal
(and
(pred_4 obj_08 obj_03)
(pred_4 obj_09 obj_07)
(pred_4 obj_05 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_01 ?b obj_04))))
)
)