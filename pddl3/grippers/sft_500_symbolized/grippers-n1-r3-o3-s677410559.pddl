(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_02 - type_2
obj_07 obj_05 - type_1
obj_03 obj_01 obj_08 - type_3
obj_04 obj_09 obj_06 - object)
(:init
(pred_3 obj_02 obj_03)
(pred_1 obj_02 obj_07)
(pred_1 obj_02 obj_05)
(pred_2 obj_04 obj_01)
(pred_2 obj_09 obj_01)
(pred_2 obj_06 obj_03)
)
(:goal
(and
(pred_2 obj_04 obj_01)
(pred_2 obj_09 obj_01)
(pred_2 obj_06 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_02 ?b obj_05))))
)
)