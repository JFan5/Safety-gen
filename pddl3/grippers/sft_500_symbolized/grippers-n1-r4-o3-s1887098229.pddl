(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_07 obj_05 - type_2
obj_01 obj_03 obj_10 obj_06 - type_3
obj_02 obj_09 obj_04 - object)
(:init
(pred_1 obj_08 obj_03)
(pred_2 obj_08 obj_07)
(pred_2 obj_08 obj_05)
(pred_3 obj_02 obj_06)
(pred_3 obj_09 obj_06)
(pred_3 obj_04 obj_03)
)
(:goal
(and
(pred_3 obj_02 obj_06)
(pred_3 obj_09 obj_03)
(pred_3 obj_04 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_08 ?b obj_05))))
)
)